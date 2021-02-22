import { Plugin } from '@capacitor/core';

import type { IVideoData, NvpPlugin } from './definitions';

export class NvpIOS extends Plugin implements NvpPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async start(options: { playlist: IVideoData[] }): Promise<void> {
    console.log(options.playlist);
    return;
  }
}
