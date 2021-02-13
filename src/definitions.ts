export interface NvpPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
