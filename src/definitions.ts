export interface IVideoData {
  title: string;
  album: string;
  filePath: string;
  url: string;
}

export interface NvpPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;

  start(options: { playlist: IVideoData[] }): Promise<void>;
}

declare module '@capacitor/core' {
  interface PluginRegistry {
    NvpPlugin: NvpPlugin;
  }
}
