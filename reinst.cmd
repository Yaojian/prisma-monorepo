rd packages\server\node_modules /s/q
rd node_modules /s/q
del pnpm-lock.yaml
pnpm install
cd packages\server
pnpm run generate