# manifest

A Flutter package containing all of app manifest and config.


## How To Generate File Manually

How to generate file, Please note that you need to run flutter pub get or pub get in each generator module first

1.  All String : Go to manifest directory, run on terminal `fvm flutter pub run language:generate --source-dir=../resources/langs/ --output-dir=lib/src/string/`, you need to run this command since this generator is dart module.

2.  All Assets : Go to manifest directory, run on terminal `fvm flutter pub run assets:generate` for this one, this generator is dart module.

3.  Code : Go to root directory of the project, run on terminal `fvm flutter packages pub run build_runner build`, this generator is flutter module.

All files will generated, you can just use it, cheers!
