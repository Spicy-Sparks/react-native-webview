import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';
import { Double } from 'react-native/Libraries/Types/CodegenTypes';

export interface Spec extends TurboModule {
  isFileUploadSupported(): Promise<boolean>;
  shouldStartLoadWithLockIdentifier(
    shouldStart: boolean,
    lockIdentifier: Double
  ): void;
  addListener(eventType: string): void;
  removeListeners(count: number): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RNCWebViewModule');
