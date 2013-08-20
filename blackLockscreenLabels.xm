
#import <UIKit/UIKit.h>
#import <TelephonyUI/TPLCDTextView.h>
#import <SpringBoard/SBAwayMediaControlsView.h>



//Lockscreen Labels
%hook SBAwayDateView

- (id) newNowPlayingLabelWithFont: (id)font color:(id)color{
	
	//get Preferences plist to see if the tweak is enabled
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    
    if(what){
		//call original Method with new color
        %orig(font, [UIColor blackColor]);
    }else{
        %orig(font, color);
    }
}

- (void) update{
	
	//get Preferences plist to see if the tweak is enabled
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    
	//Call original method
	%orig();
    
    if(what){
		//Get the clock Label
        TPLCDTextView *textView = MSHookIvar<TPLCDTextView *>(self, "_timeLabel");
        [textView setTextColor:[UIColor blackColor]];			//set the textcolor to black
        [textView setShadowColor:[UIColor clearColor]];			//set the textshadow to invisible
        
		//the Date Label
        TPLCDTextView *textDateView = MSHookIvar<TPLCDTextView *>(self, "_dateAndTetheringLabel");
        [textDateView setTextColor:[UIColor blackColor]];
        [textDateView setShadowColor:[UIColor clearColor]];
        
		//the UILabels if playing music
        UILabel *title = MSHookIvar<UILabel *>(self, "_nowPlayingTitleLabel");
        UILabel *artist = MSHookIvar<UILabel *>(self, "_nowPlayingArtistLabel");
        UILabel *album = MSHookIvar<UILabel *>(self, "_nowPlayingAlbumLabel");
        
		//remove the textshadow
        title.shadowColor = [UIColor clearColor];
        artist.shadowColor = [UIColor clearColor];
        album.shadowColor = [UIColor clearColor];
    }
}

%end

/*MediaControlView 
 *If mediaControls are shown
*/
%hook SBAwayMediaControlsView

- (id) _newNowPlayingLabelWithFont: (id)font color: (id)color{

	//get Preferences plist to see if the tweak is enabled
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;
    
    if(what){
		//Call original method with new color parameter
        return %orig(font, [UIColor blackColor]);
    }else{
		//Call original method
        return %orig(font, color);
    }
}

//The Labels get updated
- (void) _updateInformation{

	//get Preferences plist to see if the tweak is enabled
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.mich312.blackLockscreenLabels.plist"];
    int what = ([[prefs objectForKey:@"key"] boolValue] == YES) ? 1 : 0;

	//Call the original method
    %orig();
    
    if(what){
		//get the UILabels
        UILabel *title = MSHookIvar<UILabel *>(self, "_titleLabel");
        UILabel *artist = MSHookIvar<UILabel *>(self, "_artistLabel");
        UILabel *album = MSHookIvar<UILabel *>(self, "_albumLabel");
        
		//hide textshadow
        title.shadowColor = [UIColor clearColor];
        artist.shadowColor = [UIColor clearColor];
        album.shadowColor = [UIColor clearColor];
    }
}

%end