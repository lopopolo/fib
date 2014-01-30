#import <Foundation/Foundation.h>

NSNumber * fib(NSNumber *n)
{
    NSUInteger nn = [n unsignedIntegerValue];
    NSNumber *r = nil;
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
