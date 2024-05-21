interface KeyValuePair<Key, Value> {
  key: Key,
  value: Value,
}

const pair: KeyValuePair<string, string> = {
  key: 'hello', value: 'world'
}

console.log(pair);