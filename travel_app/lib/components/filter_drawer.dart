import 'package:flutter/material.dart';
import 'package:travel_app/components/categorie.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/interessi.dart';
import 'package:travel_app/models/meta_turistica.dart';

class FilterDrawer extends StatefulWidget {
  //questi sono i valori ATTUALI dei filtri
  final RangeValues selectedRating;
  final String? selectedCountry;
  final bool? available;
  final List<Interessi> interessi;
  //questa funzione è una callback che mi serve per impostare nella pagina di
  //ricerca i VALORI ATTUALI dei filtri quando clicco su applica
  final Function({int minRating, int maxRating, String? country, bool? available, List<Interessi> interessi}) setFilters;


  const FilterDrawer({required this.selectedRating, required this.setFilters, this.selectedCountry,
    this.available = false, required this.interessi, Key? key}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  /*  final _formKey = GlobalKey<FormState>();*/

  //variabili di STATO: contengono i valori dei filtri che si vogliono applicare
  //NB: finché non si clicca "APPLICA" i filtri non vengono applicati
  late RangeValues _selectedRating;
  String? _selectedCountry;
  late bool? _available;
  late List<Interessi> _interessi;

  //lista degli stati delle mete
  late List<String> _countryList;


  //valori iniziali del widget
  // (initState = INITIALIZE state = inizializza lo stato)
  @override
  void initState(){
    super.initState();
    //inizializzo lo stato con i valori ATTUALI dei filtri (vedi riga 6)
    _selectedRating = widget.selectedRating;
    _selectedCountry = widget.selectedCountry;
    _available = widget.available;
    _interessi = widget.interessi;

    //_coutntryList è una lista di String, che contiene gli stati di tutte le mete
    //.toSet() serve per eliminare le ripetizioni dalla lista
    //.toList() serve per ottenere la lista
    _countryList =
        MetaTuristica.listaMete.map((meta) => meta.country)
            .toSet()
            .toList();
    //.sort() serve per ordinare la lista
    _countryList.sort();
  }

  void modificaLista(Interessi? interesse){
    setState(() {
      if(interesse == null){
        _interessi = [];
      } else {
        if(_interessi.contains(interesse)){
          _interessi.remove(interesse);
        } else {
          _interessi.add(interesse);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Titolo('Filtri'),
            Expanded(
              child: Form(
                child: ListView(
                    children: [
                      Categorie(_interessi, modificaLista),
                      const SizedBox(height: 12,),
                      Text('Rating (da '
                          '${_selectedRating.start.toString().substring(0, 1)} '
                          'a ${_selectedRating.end.toString().substring(0, 1)})',
                        style: const TextStyle(fontWeight: FontWeight.w500),),
                      Row(
                        children: [
                          const Text('1'),
                          Expanded(
                            child: RangeSlider(
                              min: 1,
                              max: 5,
                              values: _selectedRating,
                              divisions: 4,
                              onChanged: (RangeValues value) {
                                setState(() {
                                  _selectedRating = value;
                                });
                              },
                              labels: RangeLabels(
                                  _selectedRating.start.toString().substring(0, 1),
                                  _selectedRating.end.toString().substring(0, 1)
                              ),

                            ),
                          ),
                          const Text('5'),
                        ],
                      ),

                      const SizedBox(height: 20,),

                      FormField(
                        builder: (context) {
                          return InputDecorator(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Country'
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String?>(
                                  isDense: true,
                                  value: _selectedCountry,
                                  items: <DropdownMenuItem<String?>>[
                                    const DropdownMenuItem(
                                      child: Text('Nessuno stato selezionato'),
                                      value: null,
                                    )
                                  ] +
                                      _countryList.map((country) =>
                                          DropdownMenuItem<String?>(
                                            child: Text(country),
                                            value: country,
                                          )
                                      ).toList(),
                                  onChanged: (metaSelezionata){
                                    setState(() {
                                      _selectedCountry = metaSelezionata;
                                    });
                                  }
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20,),

                      SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Only available'),
                          value: _available ?? false,
                          onChanged: (toggle){
                            setState(() {
                              _available = toggle;
                            });
                          }
                      )

                    ]
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        _available = null;
                        _selectedCountry = null;
                        _selectedRating = const RangeValues(1, 5);
                        _interessi = [];
                      });
                    },
                    child: const Text('Reset')
                ),
                TextButton(
                    onPressed: () {
                      widget.setFilters(
                          minRating: _selectedRating.start.toInt(),
                          maxRating: _selectedRating.end.toInt(),
                          country: _selectedCountry,
                          available: _available == false ? null : _available,
                          interessi: _interessi
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Applica'))
              ],
            )
          ],
        ),
      ),
    );
  }
}