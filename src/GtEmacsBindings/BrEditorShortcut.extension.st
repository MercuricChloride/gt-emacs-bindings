Extension { #name : #BrEditorShortcut }

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> deleteOneLetterAfterCursor [

	^ self new
		  name: 'Forward delete';
		  description:
			  'Discards the character ahead of the cursor''s position, moving all following characters one position "back" towards the freed letterspace.';
		  combination: (BlKeyCombination builder
		  	control;
		  	d;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deleter
				  selected;
				  oneAfterCursorIfOutsideOfSelection;
				  delete ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorDown [

	^ self new
		  name: 'Move cursor down';
		  description:
			  'Moves the cursor one line at a time below the current position and deselects any selected text.';
		  combination: (BlKeyCombination builder
		  	control;
		  	n;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deselecter
				  all;
				  deselect.
			  aBrTextEditor navigator
				  moveDown;
				  withoutResettingDesiredCoordinate;
				  apply ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorLeft [
	^ self new
		name: 'Move cursor left';
		description: 'Moves the cursor one letter at a time to the left from the current position and deselects any selected text.';
		combination: (BlKeyCombination builder
			control;
			b;
			build);
		performBlock: [ :aBrTextEditor | 
			aBrTextEditor selection isEmpty
				ifTrue: [ aBrTextEditor navigator
						moveLeft;
						apply ]
				ifFalse: [ aBrTextEditor deselecter
						all;
						deselect ] ];
		yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorRight [
	^ self new
		name: 'Move cursor right';
		description: 'Moves the cursor one letter at a time to the right from the current position and deselects any selected text.';
		combination: (BlKeyCombination builder
			control;
			f;
			build);
		performBlock: [ :aBrTextEditor | 
			aBrTextEditor selection isEmpty
				ifTrue: [ aBrTextEditor navigator
						moveRight;
						apply ]
				ifFalse: [ aBrTextEditor deselecter
						all;
						deselect ] ];
		yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorToLineEnd [

	^ self new
		  name: 'Move cursor to the line end';
		  description:
			  'Moves the cursor to the end of the current line and deselects any selected text.';
		  combination: (BlKeyCombination builder
		  	control;
		  	e;
		  	build);
		  combinationForMacOS:
			  ((BlKeyCombination builder
			  control;
			  e;
			  build) or: BlKeyCombination primaryArrowRight);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deselecter
				  all;
				  deselect.
			  aBrTextEditor navigator
				  moveToLineEnd;
				  apply ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorToLineStart [

	^ self new
		  name: 'Move cursor to the line start';
		  description:
			  'Moves the cursor to the start of the current line and deselects any selected text.';
		  combination: (BlKeyCombination builder
		  	control;
		  	a;
		  	build);
		  combinationForMacOS:
			  ((BlKeyCombination builder
			  	control;
			  	a;
			  	build) or: BlKeyCombination primaryArrowLeft);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deselecter
				  all;
				  deselect.
			  aBrTextEditor navigator
				  moveToLineStart;
				  apply ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorToNextWord [

	^ self new
		  name: 'Move cursor to the next word';
		  description:
			  'Moves the cursor to the end of the next (or current) word and deselects any selected text.';
		  combination: (BlKeyCombination builder meta f build);
		  combinationForMacOS: BlKeyCombination builder alt f build;
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deselecter
				  all;
				  deselect.
			  aBrTextEditor navigator
				  moveToEndNextWord;
				  apply ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorToPreviousWord [

	^ self new
		  name: 'Move cursor to the previous word';
		  description:
			  'Moves the cursor to the start of the previous (or current) word and deselects any selected text.';
		  combination: BlKeyCombination builder alt b build;
		  combinationForMacOS: BlKeyCombination builder alt b build;
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deselecter
				  all;
				  deselect.

			  aBrTextEditor navigator
				  moveToStartPreviousWord;
				  apply ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> moveCursorUp [

	^ self new
		  name: 'Move cursor up';
		  description:
			  'Moves the cursor one line at a time above the current position and deselects any selected text.';
		  combination: (BlKeyCombination builder
		  	control;
		  	p;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor deselecter
				  all;
				  deselect.
			  aBrTextEditor navigator
				  moveUp;
				  withoutResettingDesiredCoordinate;
				  apply ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectLetterAfterCursor [

	^ self new
		  name: 'Select letter to the right';
		  description:
			  'Selects one letter at a time to the right from the cursor.';
		  combination: (BlKeyCombination builder
		  	control;
		  	shift;
		  	f;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor selecter
				  moveOneToRight;
				  select ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectLetterBeforeCursor [

	^ self new
		  name: 'Select letter to the left';
		  description:
			  'Selects one letter at a time to the left from the cursor.';
		  combination: (BlKeyCombination builder
		  	control;
		  	shift;
		  	b;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor selecter
				  moveOneToLeft;
				  select ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectLineAboveCursor [

	^ self new
		  name: 'Select line above';
		  description: 'Selects one line at a time above the cursor.';
		  combination: (BlKeyCombination builder
		  	control;
		  	shift;
		  	p;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor selecter
				  moveOneUp;
				  select ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectLineAfterCursor [
	^ (self new)
		name: 'Select to the end of a line';
		description: 'Extends the selection from the current cursor position to the end of a line.';
		combination: (BlKeyCombination builder
			shift;
			control;
			e;
			build);
		combinationForMacOS: ((BlKeyCombination builder
			shift;
			control;
			e;
			build) or: BlKeyCombination shiftEnd);
		performBlock:
				[ :aBrTextEditor | 
					(aBrTextEditor selecter)
						extendToLineEnd;
						select ];
		yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectLineBeforeCursor [
	^ (self new)
		name: 'Select to the beginning of a line';
		description: 'Extends the selection from the current cursor position to the beginning of a line.';
		combination: (BlKeyCombination builder
			control;
			shift;
			a;
			build);
		combinationForMacOS: ((BlKeyCombination builder
			control;
			shift;
			a;
			build) or: BlKeyCombination shiftHome);
		performBlock:
				[ :aBrTextEditor | 
					(aBrTextEditor selecter)
						extendToLineStart;
						select ];
		yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectLineBelowCursor [

	^ self new
		  name: 'Select line below';
		  description: 'Selects one line at a time below the cursor.';
		  combination: (BlKeyCombination builder
		  	control;
		  	shift;
		  	n;
		  	build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor selecter
				  moveOneDown;
				  select ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectWordAfterCursor [

	^ self new
		  name: 'Select next word';
		  description:
			  'Extends the selection from the current cursor position to the end of the next word.';
		  combination:
			  (BlKeyCombination builder shift; meta; f; build);
		  combinationForMacOS:
			  (BlKeyCombination builder shift; alt; f; build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor selecter
				  extendToNextWordEnd;
				  select ];
		  yourself
]

{ #category : #'*GtEmacsBindings' }
BrEditorShortcut class >> selectWordBeforeCursor [

	^ self new
		  name: 'Select previous word';
		  description:
			  'Extends the selection from the current cursor position to the beginning of previous word.';
		  combination:
			  (BlKeyCombination builder shift; meta; b; build);
		  combinationForMacOS:
			  (BlKeyCombination builder shift; alt; b; build);
		  performBlock: [ :aBrTextEditor | 
			  aBrTextEditor selecter
				  extendToPreviousWordStart;
				  select ];
		  yourself
]
