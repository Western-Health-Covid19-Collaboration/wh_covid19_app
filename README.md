**🚨🚨🚨 The WHAC19 project is no longer being developed & maintained.  🚨🚨🚨** 

We are incredibly grateful to all our [contributors](#Contributors) - we did great things together
during the most difficult of times ❤️

Thank-you everybody for the huge amounts of effort which was contributed to this project.

This projects open issues, branches and PR's have been cleaned out and put in a state which gives 
an accurate snapshot of the project.  We are not soliciting pull requests or other contributions.  
The project is in a state where it could be picked up and used as a 
basis for other hospital informational apps.  Please make sure you check through the list of
open [issues](https://github.com/Western-Health-Covid19-Collaboration/wh_covid19_app/issues) before beginning any work.

# WHAC19 - Western Health Anaesthesia Covid-19

The WHAC19 app is a tool to safeguard the welfare of Western Health anaesthetists during COVID-19 and provide instant access to the most up-to-date information for time-critical procedures to ensure optimal patient care.  This app will contain information for frontline medical staff on subjects such as:

- Putting on and taking off PPE (Personal Protective Equipment)
- Taking care of your own welfare
- Intubation and Extubation checklists and steps
- Ventilation suggested initial actions and adjuncts
- ICU General Care
- ICU Tips your daily round and cross-skilling
- Contact details and newsfeeds

Currently under development by a community of volunteers.

If you've never used Github here's a [Github101.md](docs/GITHUB101.md) to get you started with the basics.

[![Codemagic build status](https://api.codemagic.io/apps/5e75f4bfdd1d6d000a198e90/5e75f4bfdd1d6d000a198e8f/status_badge.svg)](https://codemagic.io/apps/5e75f4bfdd1d6d000a198e90/5e75f4bfdd1d6d000a198e8f/latest_build)

## Contributing

If you would like to contribute to the development of the app, please read [the contribution documentation](contributing.md).


## The Plan

We will rapidly build out functionality and screens. The plan is to ship early, and ship often, deploying new builds at least once a day via CI.

Currently all data will be stored inside the app, with no CMS or web services. The app should have minimal logic, and instead just focuses on providing important information in a mobile friendly format.

### Information architecture

The app will have these screens and sections:

![App information architecture](docs/Flow-Diagram.png "The information architecture of the app")

### Screenshots

The complete set of designs are in Zeplin, but this gives some indication of how the the app will look:


<p align="center">
  <img src="docs/Main.png" width="256">
  <img src="docs/Yourself - Welfare.png" width="256">
  <img src="docs/Yourself - PPE.png" width="256">
</p>
<p align="center">
  <img src="docs/Yourself - PPE - Detail 01 - Step by Step.png" width="256">
  <img src="docs/Intubation - Checklist - 01 Team.png" width="256">
  <img src="docs/Intubation - Guide - 01 Planning.png" width="256">
</p>


## Contributors
In no particular order, the following people have contributed to building the project:

* Gregg Miller - Initial Development and ideas
* Matt Kelsh - Design
* Marc Edwards - Design
* Luke Sleeman - Project organiser
* Alessandro Favero - Flutter Dev
* Maksim Lin - Senior Flutter dev, CI
* Mike Hughes - Lead Flutter dev, CI & CD
* Adam Koch - Flutter dev
* Brett Morgan - Flutter dev
* Eric Jiang - Flutter dev
* Dylan Lange - Flutter dev
* Jonathan Galtieri - Anaesthetist
* Ben Blackman - Anaesthetic registrar
* Fabien Dade - ICU registrar
* Alice Gynther - Anaesthetist
* Kim Nguyen - Flutter dev
* Bramley Turner-Jones - Flutter dev
* Suesi Tran - Flutter dev
* June Chen - Flutter dev
* Joshua Case - Flutter dev
* Poornima Sivakumar - Documentation
* Fabio - Documentation
* Sally Chung - Testing and general support
* Carlos Melegrito - Design
* Jinju Jang - Design
* James Douglas - Intensivist
* Josh Szental - Anaesthetist
* Raffy Halim - Anaesthetist


## License

This project is licensed under the Apache 2.0 - see the `LICENSE-2.0.txt` file for details.

Western Health logos belong solely to Western Health may be subject to their copyrights and trademarks, and are not available under the same license as the rest of this application.

## Acknowledgements

So many people have worked together to make this project happen, and helped out in so many ways 🥰

Firstly a huge thanks to [all our contributors](#Contributors); Our designers, developers and all the medical staff.  Your work is what is making this project happen.

The entire [GDG Melbourne](https://www.gdgmelbourne.com) community for pulling together on this.

Several companies who have provided support and employee time, including Itty Bitty apps, and Art Processors. 

Code Magic for additional build minutes and support and Manichord for additional build minutes.

Slack for upgrading our workspace free of charge.

Apple and Google for help with expedited app reviews and listings.

Those who have given helpful and timely advice, including Byron Teu.

I've probably forgotten a bunch of people, so if you have done something and we have missed out on you; I'm deeply sorry, and appreciate your contribution.  Message Luke Sleeman and I will make sure you get added ❤️❤️❤️.
