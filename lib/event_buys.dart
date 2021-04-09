typedef EventBuysCallback = Function(String arg);

///create a  global event bus
class EventBus {
//创建一个单例
  EventBus._();
  static EventBus _instance = EventBus._();
  static EventBus get instance => _instance;
  factory EventBus() => instance;
//将事件保存
  Map<String, List<EventBuysCallback>?> maps = {};

  onOff(eventName, EventBuysCallback c) {
    if (eventName == null) return;
    maps[eventName] ??= List.empty();
    maps[eventName]?.add(c);
  }

  remove(eventName) {
    var list = maps[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i > -1; i--) {
      list.remove(i);
    }
    maps[eventName] = null;
  }
}
