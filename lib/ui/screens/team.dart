import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 400,
          child: Row(
            children: const [
              Text("MEET OUR TEAM", style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        // const SizedBox(height: 200),
        Expanded(child: PhysioListInformation()),
      ],
    );
  }
}

class PhysioListInformation extends StatelessWidget {
  final List physioProfiles = const [
    PhysioInfo(
      name: "Kamalio Aoun",
      position: "Physiotherapist",
      description: "Doctor in Physical Therpy, Dry Needling Practitioner, Cupping Practiioner, Neurac Practioner",
      picture: "",
    ),
    PhysioInfo(
      name: "Reind Doughan",
      position: "Stress Managment Coach",
      description: "Doctor in Physical Therpy, Integrative Stress Magaement Coach , CBT Therapist, ELB Practioner",
      picture: "",
    ),
    PhysioInfo(
      name: "Eliott Jabsi",
      position: "Physiotherapist",
      description: "Acupuncturist, Dry Needling Practitioner, Cupping Therapist",
      picture: "",
    ),
  ];

  const PhysioListInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: physioProfiles.length,
      itemBuilder: (context, index) {
        return physioProfiles[index];
      },
    );
  }
}

class PhysioInfo extends StatelessWidget {
  final String position;
  final String name;
  final String picture;
  final String description;

  const PhysioInfo({required this.position, required this.name, required this.picture, required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 400,
        width: 400,
        child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(picture)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(name.toUpperCase())
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
