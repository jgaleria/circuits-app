import { StyleSheet, Text, View } from 'react-native';
import { COLORS, TYPOGRAPHY, SPACING } from '@/constants';

export const HomeScreen = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Circuits</Text>
      <Text style={styles.subtitle}>Connect your fitness journey</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: TYPOGRAPHY.sizes['3xl'],
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
    marginBottom: SPACING.sm,
  },
  subtitle: {
    fontSize: TYPOGRAPHY.sizes.lg,
    color: COLORS.text.secondary,
    textAlign: 'center',
  },
}); 