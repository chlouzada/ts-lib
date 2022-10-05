import { test, assert } from 'vitest';
import { hello } from './index';

test('test', () => {
  assert.equal(hello(), 'world');
});
