import { test, assert } from 'vitest';
import { hello } from '../src';

test('test', () => {
  assert.equal(hello(), 'world');
});
