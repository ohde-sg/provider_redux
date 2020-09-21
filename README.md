# provider_redux

provider with redux

## Example

```dart
class IncrementAction {}

class Counter extends Store{
  // Properties
  int count = 0;
  int count2 = 0;

  // Reducers
  List<Reducer> reducers = [
    Reducer<IncrementAction, Counter>(reducer: (x, store) {
      store.count++;
      if (store.count % 2 == 0) {
        store.count2++;
      }
    })
  ];
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Redux Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            const Count(),
            const Count2(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().dispatch(IncrementAction()),
        tooltip: 'Increment',
        child: const Icon(Icons.add_box),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, child) {
        print("called count");
        return Text("${counter.count.toString()}",
            style: Theme.of(context).textTheme.headline4);
      },
    );
  }
}

class Count2 extends StatelessWidget {
  const Count2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Counter, int>(
      selector: (c, state) => state.count2,
      builder: (c, count, child) {
        print("called count2");
        return Text('${count.toString()}',
            style: Theme.of(context).textTheme.headline4);
      },
    );
  }
}

```
