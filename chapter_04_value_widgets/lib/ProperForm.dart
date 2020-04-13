// Back to normal
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum SearchType { web, image, news, shopping }
enum SearchLocation { anywhere, title, text }

// This is a stateful widget. Don't worry about its details until
// Chapter 9. For now, just focus on the Form below.
class ProperForm extends StatefulWidget {
 @override
 _ProperFormState createState() => _ProperFormState();
}
class _ProperFormState extends State<ProperForm> {
 // A Map/hash to hold the data from the Form.
 final Map<String, dynamic> _searchForm = <String, dynamic>{
  'searchTerm': '',
  'email': '',
  'numberOfResults': 100,
  'searchType': SearchType.web,
  'safeSearchOn': true,
  'searchLocation': SearchLocation.anywhere,
 };

 // The Flutter key to point to the Form from elsewhere
 final GlobalKey<FormState> _key = GlobalKey();

 // Allows us to have an initial value for Email if we wanted it.
 final TextEditingController _emailController = TextEditingController();

 @override
 void initState() {
  super.initState();
  _emailController.text = _searchForm['email'];
 }

 @override
 Widget build(BuildContext context) {
  final TextStyle _labelStyle =
    Theme.of(context).textTheme.title.copyWith(color: Colors.deepPurple);
  return Form(
   key: _key,
   // Make this true to have it validate on every keystroke. In this
   // case we only want to validate on submit.
   //autovalidate: true,
   child: Container(
    padding: const EdgeInsets.all(20),
    child: ListView(
     children: <Widget>[
      Text(
       'Advanced search - With Form',
       style: Theme.of(context).textTheme.title,
      ),
      Text(
       'What are you searching for?',
       style: _labelStyle,
      ),
      TextFormField(
       initialValue: _searchForm['searchTerm'],
       decoration: InputDecoration(
        labelText: 'Search terms',
       ),
       // On every keystroke, do something.
       onChanged: (String val) {
        setState(() => _searchForm['searchTerm'] = val);
       },
       // When the user submits, do something for this field
       // The 'val' below is the String in the textbox
       onSaved: (String val) {
        print(
          'Form saved: Search Term TextFormField: $val ${_searchForm['searchTerm']}');
        setState(() {
         _searchForm['searchTerm'] = val;
        });
       },
       // Called when we "validate()". The val again is the String
       // in the text box.
       // Note that it returns a String; null if validation passes
       // and an error message if it fails for some reason.
       validator: (String val) {
        if (val.isEmpty) {
         return 'We need something to search for';
        }
        return null;
       },
      ),
      Text("SearchTerm is ${_searchForm['searchTerm']}"),
      Text(
       'Email (if you want results sent to you)',
       style: _labelStyle,
      ),
      FormField<String>(
       initialValue: _searchForm['email'],
       builder: (FormFieldState<String> state) {
        return TextField(
         controller: _emailController,
         inputFormatters: <TextInputFormatter>[
          BlacklistingTextInputFormatter(RegExp('[" \' \\\\]')),
          LengthLimitingTextInputFormatter(30)
         ],
         decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'you@email.com',
          icon: Icon(Icons.contact_mail),
          // This says if the value looks like an
          // email set errorText to null. If not
          // display an error message.
          errorText: RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
              .hasMatch(_emailController.text)
            ? null
            : "That's not an email address",
         ),
         onChanged: (String val) {
          setState(() => _searchForm['email'] = val);
         },
        );
       },
       onSaved: (String initialValue) {
        print('Form saved: Email TextField: ${_searchForm['email']}');
       },
       validator: (String val) {
        print(val);
        if (RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
          .hasMatch(val)) {
         return null;
        } else {
         return "That's not an email address";
        }
       },
      ),
      Text("Email is ${_searchForm['email']}"),
      Text(
       'Number of results',
       style: _labelStyle,
      ),
      FormField<double>(
       // initialValue: 77.0, // Ignored on a Slider which needs its own value property
       builder: (FormFieldState<double> num) {
        return Slider(
         label: _searchForm['numberOfResults'].round().toString(),
         min: 0.0,
         max: 100.0,
         divisions: 100,
         value: _searchForm['numberOfResults'].toDouble(),
         onChanged: (double val) {
          setState(
            () => _searchForm['numberOfResults'] = val.round());
         },
        );
       },
       onSaved: (double initialValue) {
        print(
          'Form saved: # of Results slider: ${_searchForm['numberOfResults']}');
       },
      ),
      Text("Slider value ${_searchForm['numberOfResults'].toString()}"),
      Text(
       'Type of search',
       style: _labelStyle,
      ),
      FormField<SearchType>(
       //initialValue: SearchType.image, //Ignored for DropDownButtons who have their own value property
       builder: (FormFieldState<SearchType> state) {
        return DropdownButton<SearchType>(
         value: _searchForm['searchType'],
         items: const <DropdownMenuItem<SearchType>>[
          DropdownMenuItem<SearchType>(
           child: Text('Web'),
           value: SearchType.web,
          ),
          DropdownMenuItem<SearchType>(
           child: Text('Image'),
           value: SearchType.image,
          ),
          DropdownMenuItem<SearchType>(
           child: Text('News'),
           value: SearchType.news,
          ),
          DropdownMenuItem<SearchType>(
           child: Text('Shopping'),
           value: SearchType.shopping,
          ),
         ],
         onChanged: (SearchType val) {
          setState(() => _searchForm['searchType'] = val);
         },
        );
       },
       onSaved: (SearchType initialValue) {
        print(
          'Form saved: searchType dropdown: ${_searchForm['searchType']}');
       },
      ),
      Text(
       'SafeSearch',
       style: _labelStyle,
      ),
      // Wrapping the Checkbox in a FormField so we can have an
      // onSaved and a validator
      FormField<bool>(
       //initialValue: false, // Ignored for Checkboxes
       builder: (FormFieldState<bool> state) {
        return Row(
         children: <Widget>[
          Checkbox(
           value: _searchForm['safeSearchOn'],
           // Every time it changes, you can do something.
           onChanged: (bool val) {
            setState(() => _searchForm['safeSearchOn'] = val);
           },
          ),
          const Text('Safesearch on'),
         ],
        );
       },
       // When the user saves, this is run
       onSaved: (bool initialValue) {
        print(
          'Form saved: safeSearch Checkbox: ${_searchForm['safeSearchOn']}');
       },
       // No need for validation because it is a checkbox. But
       // if you wanted it, put a validator function here.
      ),
      Text(
       'Terms appearing ...',
       style: _labelStyle,
      ),
      FormField<SearchLocation>(
       //initialValue: SearchLocation.title, // Ignored for Radio groups
       builder: (FormFieldState<SearchLocation> state) {
        return Column(
         children: <Widget>[
          Row(
           children: <Widget>[
            Radio<SearchLocation>(
             groupValue: _searchForm['searchLocation'],
             value: SearchLocation.anywhere,
             onChanged: (SearchLocation val) {
              setState(() => _searchForm['searchLocation'] = val);
             },
            ),
            const Text('Search anywhere'),
           ],
          ),
          Row(
           children: <Widget>[
            Radio<SearchLocation>(
             groupValue: _searchForm['searchLocation'],
             value: SearchLocation.text,
             onChanged: (SearchLocation val) {
              setState(() => _searchForm['searchLocation'] = val);
             },
            ),
            const Text('Search page text'),
           ],
          ),
          Row(
           children: <Widget>[
            Radio<SearchLocation>(
             groupValue: _searchForm['searchLocation'],
             value: SearchLocation.title,
             onChanged: (SearchLocation val) {
              setState(() => _searchForm['searchLocation'] = val);
             },
            ),
            const Text('Search page title'),
           ],
          ),
          Text(_searchForm['searchLocation'].toString()),
         ],
        );
       },
       onSaved: (SearchLocation initialValue) {
        print(
          'Form saved: searchLocation Radio group: ${_searchForm['searchLocation']}');
       },
      ),
      // This is the Save button
      RaisedButton(
       child: const Text('Submit'),
       onPressed: () {
        // If every field passes validation, let them through.
        // Remember, this calls the validator on all fields in
        // the form.
        if (_key.currentState.validate()) {
         // Similarly this calls onSaved() for all fields
         _key.currentState.save();
         // You'd save the data to a database or whatever here
         print('Successfully saved the state.');
         showDialog<void>(
          context: context,
          builder: (BuildContext context) {
           return SimpleDialog(
            children: <Widget>[
             const Text(
               "You submitted the form. Here's the form state"),
             ..._searchForm.keys.map<Text>((String key) =>
               Text('$key = ${_searchForm[key]}')),
            ],
           );
          },
         );
        }
       },
      )
     ],
    ),
   ),
  );
 }
}
