#import <Foundation/Foundation.h>

static NSMutableDictionary *cache = nil;

unsigned long long fib(unsigned long long n);

unsigned long long fib(unsigned long long n)
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        cache = [NSMutableDictionary dictionaryWithCapacity:n];
    });
    NSNumber *key = [NSNumber numberWithUnsignedLongLong:n];
    unsigned long long r = [cache[key] unsignedLongLongValue];
    if (cache[key] == nil)
    {
        if (n < 2ULL)
        {
            r = 1ULL;
        }
        else
        {
            r = fib(n - 1) + fib(n - 2);
        }
        cache[key] = [NSNumber numberWithUnsignedLongLong:r];
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
        printf("%llu\n", fib(n));
        return 0;
    }
}
