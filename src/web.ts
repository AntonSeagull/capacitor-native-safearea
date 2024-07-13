import { WebPlugin } from '@capacitor/core';

import type { CapSafeAreaPlugin } from './definitions';

export class CapSafeAreaWeb extends WebPlugin implements CapSafeAreaPlugin {
  async showTopSafeArea(options: { color?: string }): Promise<void> {
    const color = options.color || '#FFFFFF';
    console.log('SHOW TOP SAFE AREA', color);
  }

  async showBottomSafeArea(options: { color?: string }): Promise<void> {
    const color = options.color || '#FFFFFF';
    console.log('SHOW BOTTOM SAFE AREA', color);
  }
}
