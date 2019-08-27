import 'package:flutter/material.dart';

import 'package:flutter_datatables/src/model/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;
 
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }
 
  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }
 
  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }
 
  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }
 
  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            sortAscending: sort,
            sortColumnIndex: 0,
            columns: [
              DataColumn(
                  label: Text("FIRST NAME"),
                  numeric: false,
                  tooltip: "This is First Name",
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColum(columnIndex, ascending);
                  }),
              DataColumn(
                label: Text("LAST NAME"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("LAST NAME"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("LAST NAME"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
            ],
            rows: users.map((user) {
              return DataRow(
                selected: selectedUsers.contains(user),
                onSelectChanged: (b) {
                  print("Onselect");
                  onSelectedRow(b, user);
                },
                cells: [
                  DataCell(
                    Text(user.firstName),
                    onTap: () {
                      print('Selected ${user.firstName}');
                    },
                  ),
                  DataCell(
                    Text(user.lastName),
                  ),
                  DataCell(
                    Text(user.lastName),
                  ),
                  DataCell(
                    Text(user.lastName),
                  ),
                ]);
              }
            ).toList(),
          ),
      )
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amberAccent,
            ),
          ),
          Expanded(
            flex: 4,
            child: dataBody(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueAccent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
