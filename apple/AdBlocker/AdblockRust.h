// The XCFramework must have a copy of this header file
#ifndef AdblockRust_h
#define AdblockRust_h

#ifdef __cplusplus
extern "C" {
#endif

bool create_engine_and_check_request_c(const char *url, const char *source_url, const char *request_type);

typedef struct {
    char *rules_json;
    int truncated;
} CContentBlockingRules;

CContentBlockingRules *convert_rules_to_content_blocking_c(const char *rules);

void free_content_blocking_rules(CContentBlockingRules *rules);

#ifdef __cplusplus
}
#endif

#endif /* AdblockRust_h */
