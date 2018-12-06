declare module "chai-json-equal" {
    function jsonEqual(chai: any): void;

    export = jsonEqual;
}

declare namespace Chai {
    interface Assertion extends LanguageChains, NumericComparison, TypeComparison {
        jsonEqual(compareTo: any): Assertion;
    }
}
