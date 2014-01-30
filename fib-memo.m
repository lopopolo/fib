#import <Foundation/Foundation.h>

static NSMutableDictionary *cache = nil;

NSNumber * fib(NSNumber *n)
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        cache = [NSMutableDictionary dictionaryWithCapacity:[n unsignedIntegerValue]];
    });
    NSNumber *r = [cache objectForKey:n];
    if (r == nil)
    {
        NSUInteger nn = [n unsignedIntegerValue];
        if (nn < 2U)
        {
            r = [NSNumber numberWithUnsignedInteger:1U];
        }
        else
        {
            NSNumber *n1 = [NSNumber numberWithUnsignedInteger:nn - 1];
            NSNumber *n2 = [NSNumber numberWithUnsignedInteger:nn - 2];
            r = [NSNumber numberWithUnsignedInteger:[fib(n1) unsignedIntegerValue] + [fib(n2) unsignedIntegerValue]];
        }
        cache[n] = r;
    }
    return r;
}


int main(int argc, char * argv[])
{
    @autoreleasepool {
        unsigned long n = 40;
        if (argc > 1)
        {
            n = atoi(argv[1]);
        }
        printf("%lu\n", [fib([NSNumber numberWithUnsignedInteger:n]) unsignedIntegerValue]);
        return 0;
    }
}
