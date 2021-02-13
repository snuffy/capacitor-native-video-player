import { registerPlugin } from '@capacitor/core';

import type { NvpPlugin } from './definitions';

const Nvp = registerPlugin<NvpPlugin>('Nvp', {
  web: () => import('./web').then(m => new m.NvpWeb()),
});

export * from './definitions';
export { Nvp };
