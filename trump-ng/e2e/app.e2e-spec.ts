import { TrumpNgPage } from './app.po';

describe('trump-ng App', () => {
  let page: TrumpNgPage;

  beforeEach(() => {
    page = new TrumpNgPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
