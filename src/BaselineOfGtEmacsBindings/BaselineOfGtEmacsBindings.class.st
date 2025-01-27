Class {
	#name : #BaselineOfGtEmacsBindings,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtEmacsBindings
}

{ #category : #baseline }
BaselineOfGtEmacsBindings >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtEmacsBindings'
		]
]
