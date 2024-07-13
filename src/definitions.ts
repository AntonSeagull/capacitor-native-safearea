export interface CapSafeAreaPlugin {
  showTopSafeArea(options: { color?: string }): Promise<void>;
  showBottomSafeArea(options: { color?: string }): Promise<void>;
}
