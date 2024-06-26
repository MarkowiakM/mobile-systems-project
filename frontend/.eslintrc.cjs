module.exports = {
  root: true,
  env: { browser: true, es2020: true },
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react-hooks/recommended",
    "plugin:react/recommended",
    "plugin:react/jsx-runtime",
    "prettier",
  ],
  ignorePatterns: [
    "dist",
    ".eslintrc.cjs",
    "cypress.config.ts",
    "postcss.config.js",
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
    project: ["./tsconfig.json", "./tsconfig.node.json"],
    tsconfigRootDir: __dirname,
  },
  plugins: ["react-refresh", "@typescript-eslint"],
  rules: {
    "spaced-comment": "error",
    "no-duplicate-imports": "error",
    "prefer-template": "warn",
    "no-param-reassign": "warn",
    "no-redeclare": "warn",
    "no-useless-rename": "warn",
    "prefer-spread": "warn",
    "no-implicit-coercion": "warn",
    "prefer-const": "warn",
    quotes: ["error", "double", { avoidEscape: true }],
    "@typescript-eslint/unbound-method": ["error", { ignoreStatic: true }],
    "@typescript-eslint/no-confusing-void-expression": ["error", { ignoreArrowShorthand: true }],
    "@typescript-eslint/no-extraneous-class": "off",
    "@typescript-eslint/prefer-nullish-coalescing": "warn",
  },
  settings: {
    react: {
      version: "detect",
    },
  },
  overrides: [
    {
      files: ["./src/components/ui/**/*.tsx"],
      extends: ["./src/components/ui/.eslintrc.cjs"],
    },
  ],
};
