import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'checkBalace' : () => Promise<bigint>,
  'topUp' : (arg_0: bigint) => Promise<undefined>,
  'withdraw' : (arg_0: bigint) => Promise<undefined>,
}
