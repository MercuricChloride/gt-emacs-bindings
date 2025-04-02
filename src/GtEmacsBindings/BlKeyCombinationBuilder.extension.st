Extension { #name : #BlKeyCombinationBuilder }

{ #category : #'*GtEmacsBindings' }
BlKeyCombinationBuilder >> slash [
	combination
		with: (BlSingleKeyCombination new key: BlKeyboardKey slash)
]
