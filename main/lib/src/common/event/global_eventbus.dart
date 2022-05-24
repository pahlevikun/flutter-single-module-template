import 'package:product_catalog/src/h.dart';
import 'package:rxdart/rxdart.dart';

const String _DEFAULT_IDENTIFIER = "eventbus_default_identifier";

class Bus {
  PublishSubject? _publishSubject;
  String _tag;

  PublishSubject get subject => _publishSubject!;

  String get tag => _tag;


  Bus(this._tag) {
    this._tag = tag;
    _publishSubject = PublishSubject();
  }

  /*Bus.create() {
    _publishSubject = PublishSubject();
    this._tag = _DEFAULT_IDENTIFIER;
  }

  Bus.stop(){
    _publishSubject.close();
  }*/
}

class RxBus {
  static final RxBus _singleton = new RxBus._internal();

  factory RxBus() {
    return _singleton;
  }

  RxBus._internal();

  /*static List<Bus> _list = List();

  static RxBus get singleton => _singleton;

  static Stream<T> register<T>({String tag}) {
    if (tag != null && tag == _DEFAULT_IDENTIFIER) {
      throw FlutterError(
          'EventBus register tag Can\'t is $_DEFAULT_IDENTIFIER ');
    }
    Bus _eventBus;
    if (_list.isNotEmpty && tag != null) {
      _list.forEach((bus) {
        if (bus.tag == tag) {
          _eventBus = bus;
          return;
        }
      });
      if (_eventBus == null) {
        _eventBus = Bus(tag);
        _list.add(_eventBus);
      }
    } else {
      _eventBus = tag == null ? Bus.create() : Bus(tag);
      _list.add(_eventBus);
    }

    if (T == dynamic) {
      _eventBus.subject.stream;
    } else {
      return _eventBus.subject.stream.where((event) => event is T).cast<T>();
    }
  }

  static void post(event, {tag}) {
    _list.forEach((rxBus) {
      if (tag != null && tag != _DEFAULT_IDENTIFIER && rxBus.tag == tag) {
        rxBus.subject.sink.add(event);
      } else if ((tag == null || tag == _DEFAULT_IDENTIFIER) &&
          rxBus.tag == _DEFAULT_IDENTIFIER) {
        rxBus.subject.sink.add(event);
      }
    });
  }

  static void destroy({tag}) {
    var toRemove = [];
    _list.forEach((rxBus) {
      if (tag != null && tag != _DEFAULT_IDENTIFIER && rxBus.tag == tag) {
        rxBus.subject.close();
        toRemove.add(rxBus);
      } else if ((tag == null || tag == _DEFAULT_IDENTIFIER) &&
          rxBus.tag == _DEFAULT_IDENTIFIER) {
        rxBus.subject.close();
        toRemove.add(rxBus);
      }
    });
    toRemove.forEach((rxBus) {
      _list.remove(rxBus);
    });
  }*/
}
