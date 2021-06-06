This repository tests the module resolution of `@prisma/client` in a PNPM monorepo.

## Setup

```
pnpm install
cd packages\server
pnpm run generate
```

## The Compilation fails

The typescript compilation fails

```
$ pnpx tsc
src/script.ts:1:24 - error TS2305: Module '"../node_modules/@prisma/client"' has no exported member 'User'.

1 import { PrismaClient, User } from '@prisma/client'
                         ~~~~
```

## Reason

The type `User` statement `import { PrismaClient, User } from '@prisma/client'` in [`src/script.ts`](./packages/server/src/script.ts)
cannot be resolved.

It seems that the module `@prisma/client` is resolved to 
`node_modules/.pnpm/@prisma+client@2.24.1_prisma@2.24.1/node_modules/@prisma/client/index.d.ts`
under the project root's `node_modules` rather than `packages/server/node_modules/@prisma/client/index.d.ts`.

The same code has no problem when using NPM instead of PNPM.