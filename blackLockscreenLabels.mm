#line 1 "/Users/michael/Documents/iOsOpenDev/blackLockscreenLabels/blackLockscreenLabels/blackLockscreenLabels.xm"

#import <UIKit/UIKit.h>
#import <TelephonyUI/TPLCDTextView.h>
#import <SpringBoard/SBAwayMediaControlsView.h>




#include <logos/logos.h>
#include <substrate.h>
@class SBAwayMediaControlsView; @class SBAwayDateView; 
static id (*_logos_orig$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$)(SBAwayDateView*, SEL, id, id); static id _logos_method$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$(SBAwayDateView*, SEL, id, id); static void (*_logos_orig$_ungrouped$SBAwayDateView$update)(SBAwayDateView*, SEL); static void _logos_method$_ungrouped$SBAwayDateView$update(SBAwayDateView*, SEL); static id (*_logos_orig$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$)(SBAwayMediaControlsView*, SEL, id, id); static id _logos_method$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$(SBAwayMediaControlsView*, SEL, id, id); static void (*_logos_orig$_ungrouped$SBAwayMediaControlsView$_updateInformation)(SBAwayMediaControlsView*, SEL); static void _logos_method$_ungrouped$SBAwayMediaControlsView$_updateInformation(SBAwayMediaControlsView*, SEL); 

#line 9 "/Users/michael/Documents/iOsOpenDev/blackLockscreenLabels/blackLockscreenLabels/blackLockscreenLabels.xm"


static id _logos_method$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$(SBAwayDateView* self, SEL _cmd, id font, id color){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    
    if(what){
        _logos_orig$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$(self, _cmd, font, [UIColor blackColor]);
    }else{
        _logos_orig$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$(self, _cmd, font, color);
    }
}

static void _logos_method$_ungrouped$SBAwayDateView$update(SBAwayDateView* self, SEL _cmd){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    _logos_orig$_ungrouped$SBAwayDateView$update(self, _cmd);
    
    if(what){
        TPLCDTextView *textView = MSHookIvar<TPLCDTextView *>(self, "_timeLabel");
        [textView setTextColor:[UIColor blackColor]];
        [textView setShadowColor:[UIColor clearColor]];
        
        TPLCDTextView *textDateView = MSHookIvar<TPLCDTextView *>(self, "_dateAndTetheringLabel");
        [textDateView setTextColor:[UIColor blackColor]];
        [textDateView setShadowColor:[UIColor clearColor]];
        
        UILabel *title = MSHookIvar<UILabel *>(self, "_nowPlayingTitleLabel");
        UILabel *artist = MSHookIvar<UILabel *>(self, "_nowPlayingArtistLabel");
        UILabel *album = MSHookIvar<UILabel *>(self, "_nowPlayingAlbumLabel");
        
        title.shadowColor = [UIColor clearColor];
        artist.shadowColor = [UIColor clearColor];
        album.shadowColor = [UIColor clearColor];
    }
}






static id _logos_method$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$(SBAwayMediaControlsView* self, SEL _cmd, id font, id color){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    
    if(what){
        return _logos_orig$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$(self, _cmd, font, [UIColor blackColor]);
    }else{
        return _logos_orig$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$(self, _cmd, font, color);
    }
}

static void _logos_method$_ungrouped$SBAwayMediaControlsView$_updateInformation(SBAwayMediaControlsView* self, SEL _cmd){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    
    
    
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    
    
    
    _logos_orig$_ungrouped$SBAwayMediaControlsView$_updateInformation(self, _cmd);
    
    if(what){
        UILabel *title = MSHookIvar<UILabel *>(self, "_titleLabel");
        UILabel *artist = MSHookIvar<UILabel *>(self, "_artistLabel");
        UILabel *album = MSHookIvar<UILabel *>(self, "_albumLabel");
        
        title.shadowColor = [UIColor clearColor];
        artist.shadowColor = [UIColor clearColor];
        album.shadowColor = [UIColor clearColor];
    }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBAwayDateView = objc_getClass("SBAwayDateView"); MSHookMessageEx(_logos_class$_ungrouped$SBAwayDateView, @selector(newNowPlayingLabelWithFont:color:), (IMP)&_logos_method$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$, (IMP*)&_logos_orig$_ungrouped$SBAwayDateView$newNowPlayingLabelWithFont$color$);MSHookMessageEx(_logos_class$_ungrouped$SBAwayDateView, @selector(update), (IMP)&_logos_method$_ungrouped$SBAwayDateView$update, (IMP*)&_logos_orig$_ungrouped$SBAwayDateView$update);Class _logos_class$_ungrouped$SBAwayMediaControlsView = objc_getClass("SBAwayMediaControlsView"); MSHookMessageEx(_logos_class$_ungrouped$SBAwayMediaControlsView, @selector(_newNowPlayingLabelWithFont:color:), (IMP)&_logos_method$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$, (IMP*)&_logos_orig$_ungrouped$SBAwayMediaControlsView$_newNowPlayingLabelWithFont$color$);MSHookMessageEx(_logos_class$_ungrouped$SBAwayMediaControlsView, @selector(_updateInformation), (IMP)&_logos_method$_ungrouped$SBAwayMediaControlsView$_updateInformation, (IMP*)&_logos_orig$_ungrouped$SBAwayMediaControlsView$_updateInformation);} }
#line 85 "/Users/michael/Documents/iOsOpenDev/blackLockscreenLabels/blackLockscreenLabels/blackLockscreenLabels.xm"
