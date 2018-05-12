//
//  main.m
//  cupssample
//

#import <Foundation/Foundation.h>
// Build Phases->Link Binary With Library libcups.tbd
#include <cups/cups.h>
#include <cups/ppd.h>

void cupsParseOptionSample(void);
void addoptionSample(void);

int main(int argc, const char * argv[]) {
    
    // man lp
    // https://www.cups.org/documentation.html
    cupsParseOptionSample();
    addoptionSample();
    
    return 0;
}

void cupsParseOptionSample() {
    // https://www.cups.org/doc/options.html
    // Standard Printing Options
    // -o media=xyz
    
    int           num_options;
    cups_option_t *options;
    const char    *val;
    options     = NULL;
    
    num_options = cupsParseOptions("media=xyz", 0, &options);
    val = cupsGetOption("media", num_options, options);
    if (val) {
        printf("value=%s", val);
    } else {
        printf("can not get value");
    }
}

void addoptionSample() {
    // https://opensource.apple.com/source/cups/cups-30/doc/spm.shtml
    int num_options = 0;
    cups_option_t *options;
    options     = NULL;
    //    num_options = cupsAddOption("hoge", "hogevalue", num_options, &options);
    num_options = cupsAddOption("var", "value", num_options, &options);
    num_options = cupsAddOption("zot", "value", num_options, &options);
    num_options = cupsAddOption("foo", "value", num_options, &options);
    
    // cupsAddOption NULL
    const char *val = cupsGetOption("hoge", num_options, options);
    if (val) {
        printf("value=%s", val);
    } else {
        printf("can not get value");
    }
}
