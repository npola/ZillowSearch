// Generated by Swift version 1.1 (swift-600.0.57.4)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import ObjectiveC;
@import Foundation.NSURLSession;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC23com_zillow_ZillowSearch11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * window;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationWillEnterForeground:(UIApplication *)application;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIButton;
@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UIAlertView;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC23com_zillow_ZillowSearch9BasicInfo")
@interface BasicInfo : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
@property (nonatomic, copy) NSDictionary * jsonData;
@property (nonatomic) IBOutlet UILabel * zestimate;
@property (nonatomic) IBOutlet UILabel * terms;
@property (nonatomic, copy) NSDictionary * key;
@property (nonatomic, copy) NSDictionary * value;
@property (nonatomic, copy) NSDictionary * address;
- (void)viewDidLoad;
- (void)openTermsUrl;
- (void)openZestimateUrl;
- (void)didReceiveMemoryWarning;
- (IBAction)facebookShare:(UIButton *)sender;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)alertView:(UIAlertView *)View clickedButtonAtIndex:(NSInteger)buttonIndex;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end



/// Subclass of NSOperation for handling and scheduling HTTPTask on a NSOperationQueue.
SWIFT_CLASS("_TtC23com_zillow_ZillowSearch13HTTPOperation")
@interface HTTPOperation : NSOperation

/// Controls if the task is finished or not.
@property (nonatomic) BOOL done;

/// Returns if the task is asynchronous or not. This should always be false.
@property (nonatomic, readonly, getter=isAsynchronous) BOOL asynchronous;

/// Returns if the task has been cancelled or not.
@property (nonatomic, readonly, getter=isCancelled) BOOL cancelled;

/// Returns if the task is current running.
@property (nonatomic, readonly, getter=isExecuting) BOOL executing;

/// Returns if the task is finished.
@property (nonatomic, readonly, getter=isFinished) BOOL finished;

/// Returns if the task is ready to be run or not.
@property (nonatomic, readonly, getter=isReady) BOOL ready;

/// Starts the task.
- (void)start;

/// Cancels the running task.
- (void)cancel;

/// Sets the task to finished.
- (void)finish;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class HTTPPair;
@class NSData;


/// Default Serializer for serializing an object to an HTTP request. This applies to form serialization, parameter encoding, etc.
SWIFT_CLASS("_TtC23com_zillow_ZillowSearch21HTTPRequestSerializer")
@interface HTTPRequestSerializer : NSObject
@property (nonatomic, readonly, copy) NSString * contentTypeKey;

/// headers for the request.
@property (nonatomic, copy) NSDictionary * headers;

/// encoding for the request.
@property (nonatomic) NSUInteger stringEncoding;

/// Send request if using cellular network or not. Defaults to true.
@property (nonatomic) BOOL allowsCellularAccess;

/// If the request should handle cookies of not. Defaults to true.
@property (nonatomic) BOOL HTTPShouldHandleCookies;

/// If the request should use piplining or not. Defaults to false.
@property (nonatomic) BOOL HTTPShouldUsePipelining;

/// How long the timeout interval is. Defaults to 60 seconds.
@property (nonatomic) NSTimeInterval timeoutInterval;

/// Set the request cache policy. Defaults to UseProtocolCachePolicy.
@property (nonatomic) NSURLRequestCachePolicy cachePolicy;

/// Set the network service. Defaults to NetworkServiceTypeDefault.
@property (nonatomic) NSURLRequestNetworkServiceType networkServiceType;

/// Initializes a new HTTPRequestSerializer Object.
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// check for multi form objects
- (BOOL)isMultiForm:(NSDictionary *)params;

/// convert the parameter dict to its HTTP string representation
- (NSString *)stringFromParameters:(NSDictionary *)parameters;

/// the method to serialized all the objects
- (NSArray *)serializeObject:(id)object key:(NSString *)key;
- (NSData *)dataFromParameters:(NSDictionary *)parameters boundary:(NSString *)boundary;

/// helper method to create the multi form headers
- (NSString *)multiFormHeader:(NSString *)name fileName:(NSString *)fileName type:(NSString *)type multiCRLF:(NSString *)multiCRLF;
@end

@class NSURLSession;
@class NSURLSessionTask;
@class NSURLAuthenticationChallenge;
@class NSURLCredential;
@class NSError;
@class NSURLSessionDownloadTask;
@class NSURL;
@class NSURLSessionDataTask;


/// Configures NSURLSession Request for HTTPOperation. Also provides convenience methods for easily running HTTP Request.
SWIFT_CLASS("_TtC23com_zillow_ZillowSearch8HTTPTask")
@interface HTTPTask : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate>
@property (nonatomic, copy) NSDictionary * backgroundTaskMap;
@property (nonatomic, copy) NSString * baseURL;
@property (nonatomic) HTTPRequestSerializer * requestSerializer;

/// A newly minted HTTPTask for your enjoyment.
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Method for authentication challenge.
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler;

/// Called when the background task failed.
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error;

/// The background download finished and reports the url the data was saved to.
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;

/// Will report progress of background download
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;

/// The background download finished, don't have to really do anything.
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session;

/// not implemented yet. The background upload finished and reports the response data (if any).
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data;

/// not implemented yet.
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend;

/// not implemented yet.
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes;
@end



/// Object representation of a HTTP File Upload.
SWIFT_CLASS("_TtC23com_zillow_ZillowSearch10HTTPUpload")
@interface HTTPUpload : NSObject
@property (nonatomic) NSURL * fileUrl;
@property (nonatomic, copy) NSString * mimeType;
@property (nonatomic) NSData * data;
@property (nonatomic, copy) NSString * fileName;

/// Tries to determine the mime type from the fileUrl extension.
- (void)updateMimeType;

/// loads the fileUrl into memory.
- (void)loadData;

/// Initializes a new HTTPUpload Object.
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Initializes a new HTTPUpload Object with a fileUrl. The fileName and mimeType will be infered.
///
/// \param fileUrl The fileUrl is a standard url path to a file.
- (instancetype)initWithFileUrl:(NSURL *)fileUrl;

/// <blockquote><p>Initializes a new HTTPUpload Object with a data blob of a file. The fileName and mimeType will be infered if none are provided.</p><blockquote><dl><dt>param</dt><dd><p>data The data is a NSData representation of a file's data.</p></dd><dt>param</dt><dd><p>fileName The fileName is just that. The file's name.</p></dd><dt>param</dt><dd><p>mimeType The mimeType is just that. The mime type you would like the file to uploaded as.</p></dd></dl></blockquote></blockquote>
/// upload a file from a a data blob. Must add a filename and mimeType as that can't be infered from the data
- (instancetype)initWithData:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType;
@end

@class UIImageView;
@class NSMutableArray;
@class NSMutableDictionary;

SWIFT_CLASS("_TtC23com_zillow_ZillowSearch20HistoricalZestimates")
@interface HistoricalZestimates : UIViewController
@property (nonatomic) IBOutlet UILabel * header;
@property (nonatomic) IBOutlet UILabel * address;
@property (nonatomic) IBOutlet UILabel * terms;
@property (nonatomic) IBOutlet UILabel * zestimate;
@property (nonatomic) IBOutlet UIImageView * chart;
@property (nonatomic, copy) NSString * chartURL;
@property (nonatomic, copy) NSDictionary * Jaddress;
@property (nonatomic, copy) NSArray * headers;
@property (nonatomic) NSMutableArray * urls;
@property (nonatomic) NSMutableDictionary * imageCache;
@property (nonatomic) NSInteger imageNo;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)openTermsUrl;
- (void)openZestimateUrl;
- (IBAction)previous:(UIButton *)sender;
- (IBAction)next:(UIButton *)sender;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end



/// JSON Serializer for serializing an object to an HTTP request. Same as HTTPRequestSerializer, expect instead of HTTP form encoding it does JSON.
SWIFT_CLASS("_TtC23com_zillow_ZillowSearch21JSONRequestSerializer")
@interface JSONRequestSerializer : HTTPRequestSerializer
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23com_zillow_ZillowSearch12MyCustomCell")
@interface MyCustomCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel * key;
@property (nonatomic) IBOutlet UILabel * value;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23com_zillow_ZillowSearch13MyCustomCell2")
@interface MyCustomCell2 : UITableViewCell
@property (nonatomic) IBOutlet UILabel * key;
@property (nonatomic) IBOutlet UILabel * value;
@property (nonatomic) IBOutlet UIImageView * arrow;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;

SWIFT_CLASS("_TtC23com_zillow_ZillowSearch13MyCustomCell3")
@interface MyCustomCell3 : UITableViewCell
@property (nonatomic) IBOutlet UILabel * address;
@property (nonatomic) IBOutlet UIView * line;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23com_zillow_ZillowSearch13TabController")
@interface TabController : UITabBarController
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidLayoutSubviews;
- (void)didReceiveMemoryWarning;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;
@class UIPickerView;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC23com_zillow_ZillowSearch14ViewController")
@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (nonatomic) IBOutlet UILabel * addressWarn;
@property (nonatomic) IBOutlet UILabel * cityWarn;
@property (nonatomic) IBOutlet UILabel * stateWarn;
@property (nonatomic) IBOutlet UIImageView * zillowLogo;
@property (nonatomic) IBOutlet UITextField * street;
@property (nonatomic) IBOutlet UITextField * city;
@property (nonatomic) IBOutlet UITextField * state;
@property (nonatomic) IBOutlet UIPickerView * myPicker;
@property (nonatomic) IBOutlet UILabel * noResult;
@property (nonatomic, readonly, copy) NSArray * pickerData;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidLoad;
- (IBAction)submit:(UIButton *)sender;
- (void)noSearchResult;
- (void)searchResultSegue:(NSDictionary *)jsonData;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
