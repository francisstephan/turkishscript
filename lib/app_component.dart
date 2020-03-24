@JS()
library app_component;

import 'package:js/js.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'turc.dart';

@JS()
external void refocus();
external void copyTextToClipboard(String) ;

@Component(
  selector: 'my-app',
  template: '''
  <h1>{{title}}</h1>
  
  <div>
    <label>Type here: </label><button (click)="reset()">Reset</button> 
    <button (click)="cpttc()">Copy to clipboard</button><br /><br />
    <input id="entrée" [(ngModel)]="lang.original" placeholder="Start typing" autofocus 
      style="width:80%; height:20px;" />
  </div>
  <div><br />Get Turkish text:</div>
  <h2>{{lang.translate()}}</h2>
  ''',
  directives: [formDirectives],
)
// @ViewChild('myInput') HtmlElement _foo;
class AppComponent {
  final title = 'Use your western keyboard to get turkish text';
  Turk lang = Turk('');
  void reset()  {lang.original = "" ; refocus(); }
  void cpttc()  { copyTextToClipboard(lang.translate()); refocus(); }
}
