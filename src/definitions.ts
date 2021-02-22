export interface IVideoData {
  title: string;
  album: string;
  source: string;
}

export interface NvpPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;

  start(options: { playlist: IVideoData[] }): Promise<void>;
}
