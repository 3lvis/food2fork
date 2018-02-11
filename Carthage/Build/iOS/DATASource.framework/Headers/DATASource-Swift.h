// Generated by Apple Swift version 4.0.3 (swiftlang-900.0.74.1 clang-900.0.39.2)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_attribute(external_source_symbol)
# define SWIFT_STRINGIFY(str) #str
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name) _Pragma(SWIFT_STRINGIFY(clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in=module_name, generated_declaration))), apply_to=any(function, enum, objc_interface, objc_category, objc_protocol))))
# define SWIFT_MODULE_NAMESPACE_POP _Pragma("clang attribute pop")
#else
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name)
# define SWIFT_MODULE_NAMESPACE_POP
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import ObjectiveC;
@import CoreData;
@import Foundation;
@import UIKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("DATASource")
@class UITableView;
@class NSManagedObjectContext;
@class UITableViewCell;
@class NSManagedObject;
@class UICollectionView;
@class UICollectionViewCell;
@protocol DATASourceDelegate;
@class NSPredicate;
@class UIView;

SWIFT_CLASS("_TtC10DATASource10DATASource")
@interface DATASource : NSObject
/// Initializes and returns a data source object for a table view.
/// \param tableView A table view used to construct the data source.
///
/// \param cellIdentifier An identifier from the registered UITableViewCell subclass.
///
/// \param fetchRequest A request to be used, requests need a sort descriptor.
///
/// \param mainContext A main thread managed object context.
///
/// \param sectionName The section to be used for generating the section headers. <code>nil</code> means no grouping by section is needed.
///
/// \param configuration A configuration block that provides you the cell, the managed object and the index path to be configured.
///
- (nonnull instancetype)initWithTableView:(UITableView * _Nonnull)tableView cellIdentifier:(NSString * _Nonnull)cellIdentifier fetchRequest:(NSFetchRequest<id <NSFetchRequestResult>> * _Nonnull)fetchRequest mainContext:(NSManagedObjectContext * _Nonnull)mainContext sectionName:(NSString * _Nullable)sectionName configuration:(void (^ _Nonnull)(UITableViewCell * _Nonnull, NSManagedObject * _Nonnull, NSIndexPath * _Nonnull))configuration;
/// Initializes and returns a data source object for a collection view.
/// \param collectionView A collection view used to construct the data source.
///
/// \param cellIdentifier An identifier from the registered UICollectionViewCell subclass.
///
/// \param fetchRequest A request to be used, requests need a sort descriptor.
///
/// \param mainContext A main thread managed object context.
///
/// \param sectionName The section to be used for generating the section headers. <code>nil</code> means no grouping by section is needed.
///
/// \param configuration A configuration block that provides you the cell, the managed object and the index path to be configured.
///
- (nonnull instancetype)initWithCollectionView:(UICollectionView * _Nonnull)collectionView cellIdentifier:(NSString * _Nonnull)cellIdentifier fetchRequest:(NSFetchRequest<id <NSFetchRequestResult>> * _Nonnull)fetchRequest mainContext:(NSManagedObjectContext * _Nonnull)mainContext sectionName:(NSString * _Nullable)sectionName configuration:(void (^ _Nonnull)(UICollectionViewCell * _Nonnull, NSManagedObject * _Nonnull, NSIndexPath * _Nonnull))configuration;
/// Initializes and returns a data source object for a table view.
/// \param tableView A table view used to construct the data source.
///
/// \param cellIdentifier An identifier from the registered UITableViewCell subclass.
///
/// \param fetchRequest A request to be used, requests need a sort descriptor.
///
/// \param mainContext A main thread managed object context.
///
/// \param sectionName The section to be used for generating the section headers. <code>nil</code> means no grouping by section is needed.
///
- (nonnull instancetype)initWithTableView:(UITableView * _Nonnull)tableView cellIdentifier:(NSString * _Nonnull)cellIdentifier fetchRequest:(NSFetchRequest<id <NSFetchRequestResult>> * _Nonnull)fetchRequest mainContext:(NSManagedObjectContext * _Nonnull)mainContext sectionName:(NSString * _Nullable)sectionName;
/// Initializes and returns a data source object for a collection view.
/// \param collectionView A collection view used to construct the data source.
///
/// \param cellIdentifier An identifier from the registered UICollectionViewCell subclass.
///
/// \param fetchRequest A request to be used, requests need a sort descriptor.
///
/// \param mainContext A main thread managed object context.
///
/// \param sectionName The section to be used for generating the section headers. <code>nil</code> means no grouping by section is needed.
///
- (nonnull instancetype)initWithCollectionView:(UICollectionView * _Nonnull)collectionView cellIdentifier:(NSString * _Nonnull)cellIdentifier fetchRequest:(NSFetchRequest<id <NSFetchRequestResult>> * _Nonnull)fetchRequest mainContext:(NSManagedObjectContext * _Nonnull)mainContext sectionName:(NSString * _Nullable)sectionName;
/// The DATASource’s delegate. Used for overwritting methods overwritten by DATASource. Also used to be notified of object changes.
@property (nonatomic, weak) id <DATASourceDelegate> _Nullable delegate;
/// The DATASource’s predicate.
@property (nonatomic, strong) NSPredicate * _Nullable predicate;
/// The number of objects fetched by DATASource.
@property (nonatomic, readonly) NSInteger count;
/// Check for wheter the DATASource is empty or not. Returns <code>true</code> is the amount of objects
/// is more than 0.
@property (nonatomic, readonly) BOOL isEmpty;
@property (nonatomic, readonly, copy) NSArray<NSManagedObject *> * _Nonnull objects;
- (NSManagedObject * _Nullable)objectAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSIndexPath * _Nullable)indexPathForObject:(NSManagedObject * _Nonnull)object SWIFT_WARN_UNUSED_RESULT;
/// Returns the index path of a given managed object.
/// \param object An object in the receiver’s fetch results.
///
///
/// returns:
/// The index path of object in the receiver’s fetch results, or nil if object could not be found.
- (NSIndexPath * _Nullable)indexPath:(NSManagedObject * _Nonnull)object SWIFT_WARN_UNUSED_RESULT;
/// Executes the DATASource’s fetch request.
- (void)fetch;
- (NSString * _Nullable)titleForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
/// Returns the title of a given section. Uses given <code>sectionName</code> in the initializer to do this lookup.
/// \param section The section used to retrieve the title.
///
///
/// returns:
/// The title for the requested section, returns <code>nil</code> if the section is not present.
- (NSString * _Nullable)titleForHeader:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
/// Requests to reload the contents of the cell at a specific indexPath.
/// \param cell The cell to be loaded.
///
/// \param indexPath The indexPath where the cell is located.
///
- (void)configure:(UIView * _Nonnull)cell indexPath:(NSIndexPath * _Nonnull)indexPath;
/// Lightweight replacement for <code>reloadItemsAtIndexPaths</code> that doesn’t flash the reloaded items.
/// \param indexPaths The array of indexPaths to be reloaded.
///
- (void)reloadCellsAt:(NSArray<NSIndexPath *> * _Nonnull)indexPaths;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@protocol NSFetchedResultsSectionInfo;

@interface DATASource (SWIFT_EXTENSION(DATASource)) <NSFetchedResultsControllerDelegate>
- (void)controllerWillChangeContent:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller;
- (void)controller:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller didChangeSection:(id <NSFetchedResultsSectionInfo> _Nonnull)sectionInfo atIndex:(NSInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type;
- (void)controller:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller didChangeObject:(id _Nonnull)anObject atIndexPath:(NSIndexPath * _Nullable)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath * _Nullable)newIndexPath;
- (void)controllerDidChangeContent:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller;
@end

@class UICollectionReusableView;

@interface DATASource (SWIFT_EXTENSION(DATASource)) <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView * _Nonnull)collectionView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (UICollectionReusableView * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView viewForSupplementaryElementOfKind:(NSString * _Nonnull)kind atIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end


@interface DATASource (SWIFT_EXTENSION(DATASource)) <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSArray<NSString *> * _Nullable)sectionIndexTitlesForTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView sectionForSectionIndexTitle:(NSString * _Nonnull)title atIndex:(NSInteger)index SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForFooterInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canEditRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canMoveRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView moveRowAtIndexPath:(NSIndexPath * _Nonnull)sourceIndexPath toIndexPath:(NSIndexPath * _Nonnull)destinationIndexPath;
@end

@class NSCoder;

SWIFT_CLASS("_TtC10DATASource30DATASourceCollectionViewHeader")
@interface DATASourceCollectionViewHeader : UICollectionReusableView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_PROTOCOL("_TtP10DATASource18DATASourceDelegate_")
@protocol DATASourceDelegate <NSObject>
@optional
- (NSString * _Nonnull)dataSource:(DATASource * _Nonnull)dataSource cellIdentifierFor:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)dataSource:(DATASource * _Nonnull)dataSource configureTableViewCell:(UITableViewCell * _Nonnull)cell withItem:(NSManagedObject * _Nonnull)item atIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)dataSource:(DATASource * _Nonnull)dataSource configureCollectionViewCell:(UICollectionViewCell * _Nonnull)cell withItem:(NSManagedObject * _Nonnull)item atIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)dataSource:(DATASource * _Nonnull)dataSource didInsertObject:(NSManagedObject * _Nonnull)object atIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)dataSource:(DATASource * _Nonnull)dataSource didUpdateObject:(NSManagedObject * _Nonnull)object atIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)dataSource:(DATASource * _Nonnull)dataSource didDeleteObject:(NSManagedObject * _Nonnull)object atIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)dataSource:(DATASource * _Nonnull)dataSource didMoveObject:(NSManagedObject * _Nonnull)object fromIndexPath:(NSIndexPath * _Nonnull)oldIndexPath toIndexPath:(NSIndexPath * _Nonnull)newIndexPath;
- (void)dataSourceDidChangeContent:(DATASource * _Nonnull)dataSource;
- (NSArray<NSString *> * _Nonnull)sectionIndexTitlesForDataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView sectionForSectionIndexTitle:(NSString * _Nonnull)title atIndex:(NSInteger)index SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView titleForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView titleForFooterInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (BOOL)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView canEditRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (BOOL)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView canMoveRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)dataSource:(DATASource * _Nonnull)dataSource tableView:(UITableView * _Nonnull)tableView moveRowAtIndexPath:(NSIndexPath * _Nonnull)sourceIndexPath toIndexPath:(NSIndexPath * _Nonnull)destinationIndexPath;
- (UICollectionReusableView * _Nullable)dataSource:(DATASource * _Nonnull)dataSource collectionView:(UICollectionView * _Nonnull)collectionView viewForSupplementaryElementOfKind:(NSString * _Nonnull)kind atIndexPath:(NSIndexPath * _Nonnull)indexPath withTitle:(id _Nullable)title SWIFT_WARN_UNUSED_RESULT;
@end

SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop
