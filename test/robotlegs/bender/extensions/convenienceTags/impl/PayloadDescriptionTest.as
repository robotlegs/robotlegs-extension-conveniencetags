//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags.impl
{
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;

	import robotlegs.bender.extensions.convenienceTags.api.IPayloadExtractionPoint;

	public class PayloadDescriptionTest
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var subject:PayloadDescription;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/

		[Before]
		public function before():void
		{
			subject = new PayloadDescription();
		}

		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/

		[Test]
		public function extractionPoints_defaults_to_empty_vector():void
		{
			assertThat(subject.extractionPoints.length, equalTo(0));
		}

		[Test]
		public function sorts_extraction_points_by_ordinal() : void{
			const point1: IPayloadExtractionPoint = new FieldPayloadExtractionPoint('1',int,1);
			const point2: IPayloadExtractionPoint = new FieldPayloadExtractionPoint('2',int,2);
			const point3: IPayloadExtractionPoint = new FieldPayloadExtractionPoint('3',int,3);
			subject.addExtractionPoint(point2);
			subject.addExtractionPoint(point3);
			subject.addExtractionPoint(point1);
			subject.sortPoints();
			assertThat(subject.extractionPoints, array(point1, point2, point3));
		}
	}
}
