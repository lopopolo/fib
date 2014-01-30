#import <Foundation/Foundation.h>

static NSMutableDictionary *cache = nil;

NSNumber * fib(NSNumber *n);

NSNumber * fib(NSNumber *n)
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        cache = [NSMutableDictionary dictionaryWithCapacity:[n unsignedIntegerValue]];
    });
    NSNumber *r = [cache objectForKey:n];
    if (r == nil)
    {
        unsigned long long nn = [n unsignedLongLongValue];
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
        cache[n] = r;
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
        printf("%lu\n", [fib([NSNumber numberWithUnsignedInteger:n]) unsignedIntegerValue]);
        return 0;
    }
}
