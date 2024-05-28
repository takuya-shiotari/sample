module.exports = {
  plugins: ['stylelint-scss'],
  extends: ['stylelint-config-standard'],
  rules: { // Keys are sorted by alphabetical order.
    'at-rule-no-unknown': [true, { 'ignoreAtRules': ['include', 'mixin'] }],
    'declaration-block-single-line-max-declarations': null,
    'indentation': 2,
    'no-descending-specificity': null,
  },
}
