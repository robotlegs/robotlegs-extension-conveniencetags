package robotlegs.bender.extensions.convenienceTags.impl
{
	import flash.text.StaticText;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import robotlegs.bender.extensions.convenienceTags.api.IPayloadExtractionPoint;
	import robotlegs.bender.extensions.convenienceTags.api.IPayloadExtractionPoint;

	public class MethodPayloadExtractionPointTest
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var subject:IPayloadExtractionPoint;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/

		[Before]
		public function setup():void
		{
		}

		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/

		[Test]
		public function extracts_value_from_method():void
		{
			var instance:ExtractableObject = new ExtractableObject();
			subject = new MethodPayloadExtractionPoint('extractableMethod', String);
			assertThat(subject.extractFrom(instance), equalTo(instance.extractableMethod()));
		}
	}
}

class ExtractableObject
{

	/*============================================================================*/
	/* Public Properties                                                          */
	/*============================================================================*/

	public function extractableMethod():String
	{
		return 'extractableMethod';
	}
}
