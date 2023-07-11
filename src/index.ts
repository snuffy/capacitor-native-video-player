import { registerPlugin } from '@capacitor/core';

import type { NvpPlugin } from './definitions';

const Nvp = registerPlugin<NvpPlugin>('Nvp', {
  web: () => import('./web').then(m => new m.NvpWeb()),
  ios: () => import('./ios').then(m => new m.NvpIOS()),
  android: () => import('./ios').then(m => new m.NvpIOS()),
});

export * from './definitions';
export { Nvp };
