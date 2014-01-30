// vim: set ft=objc:
#import <Foundation/Foundation.h>

NSNumber * fib(NSNumber *n);

NSNumber * fib(NSNumber *n)
{
    unsigned long long nn = [n unsignedLongLongValue];
    NSNumber *r = nil;
    if (nn < 2U)
    {
        r = [NSNumber numberWithUnsignedLongLong:1ULL];
    }
    else
    {
        NSNumber *n1 = [NSNumber numberWithUnsignedLongLong:nn - 1ULL];
        NSNumber *n2 = [NSNumber numberWithUnsignedLongLong:nn - 2ULL];
        r = [NSNumber numberWithUnsignedLongLong:[fib(n1) unsignedLongLongValue] + [fib(n2) unsignedLongLongValue]];
    }
    return r;
}


int main(int argc, char * argv[])
{
    @autoreleasepool {
        NSUInteger n = 40U;
        if (argc > 1)
        {
            n = strtoul(argv[1], NULL, 10);
        }
        printf("%llu\n", [fib([NSNumber numberWithUnsignedInteger:n]) unsignedLongLongValue]);
        return 0;
    }
}
