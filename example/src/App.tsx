import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import GetMetadata from 'react-native-get-metadata';

export default function App() {
  const [result, setResult] = React.useState<string | undefined>();

  React.useEffect(() => {
    GetMetadata.forKey('example_metadata').then(setResult).catch(console.log);
  }, []);

  return (
    <View style={styles.container}>
      <Text>example_metadata:</Text>
      <Text>"{result}"</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
