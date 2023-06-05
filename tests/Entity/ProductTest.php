<?php

declare(strict_types=1);

namespace App\Tests\Entity;

use App\Entity\Product;
use App\Entity\ProductVariant;
use Doctrine\Common\Collections\ArrayCollection;
use PHPUnit\Framework\TestCase;

class ProductTest extends TestCase
{
    /**
     * Test methods setName and getName
     *
     * @return void
     * @covers \App\Entity\Product::setName
     * @covers \App\Entity\Product::getName
     */
    public function testNameSetterAndGetter(): void
    {
        $product = new Product();
        $this->assertNull($product->getName());

        $product->setName('Test Name');
        $this->assertEquals('Test Name', $product->getName());
    }

    /**
     * Test methods setDescription and getDescription
     *
     * @return void
     * @covers \App\Entity\Product::setDescription
     * @covers \App\Entity\Product::getDescription
     */
    public function testDescriptionSetterAndGetter(): void
    {
        $product = new Product();
        $this->assertNull($product->getDescription());

        $product->setDescription('Test Description');
        $this->assertEquals('Test Description', $product->getDescription());

        $product->setDescription(null);
        $this->assertNull($product->getDescription());
    }

    /**
     * Test methods setPrice and getPrice
     *
     * @return void
     * @covers \App\Entity\Product::setPrice
     * @covers \App\Entity\Product::getPrice
     */
    public function testPriceSetterAndGetter(): void
    {
        $product = new Product();
        $this->assertEquals(0, $product->getPrice());
        $this->assertEquals('0,00 €', $product->getPriceFormatted());

        $product->setPrice(123.4);
        $this->assertEquals(123.4, $product->getPrice());
        $this->assertEquals('123,40 €', $product->getPriceFormatted());

        $product->setPrice(89);
        $this->assertEquals(89, $product->getPrice());
        $this->assertEquals('89,00 €', $product->getPriceFormatted());
    }

    /**
     * Test methods getVariants
     *
     * @return void
     * @covers \App\Entity\Product::setPrice
     * @covers \App\Entity\Product::getPrice
     */
    public function testVariantsSetterAndGetter(): void
    {
        $product = new Product();
        $expected = new ArrayCollection();
        $this->assertEquals($expected, $product->getVariants());

        $productVariant = new ProductVariant();
        $productVariant->setProduct($product);
        $productVariant->setName('Test');
        $product->addVariant($productVariant);
        $expected->add($productVariant);
        $this->assertEquals($expected, $product->getVariants());
        $this->assertCount(1, $product->getVariants());

        $product->removeVariant($productVariant);
        $expected = new ArrayCollection();
        $this->assertEquals($expected, $product->getVariants());
        $this->assertCount(0, $product->getVariants());
    }
}
