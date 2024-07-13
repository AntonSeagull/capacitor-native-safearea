import { registerPlugin } from '@capacitor/core';

import type { CapSafeAreaPlugin } from './definitions';

const CapSafeArea = registerPlugin<CapSafeAreaPlugin>('CapSafeArea', {
  web: () => import('./web').then(m => new m.CapSafeAreaWeb()),
});

export * from './definitions';
export { CapSafeArea };
