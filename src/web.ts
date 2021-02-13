import { WebPlugin } from '@capacitor/core';

import type { NvpPlugin } from './definitions';

export class NvpWeb extends WebPlugin implements NvpPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
