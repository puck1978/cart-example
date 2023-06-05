<?php

declare(strict_types=1);

namespace App\Controller\Web;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsController extends AbstractController
{
    #[Route('/products', name: 'app_web_products')]
    public function index(
        EntityManagerInterface $entityManager
    ): Response {
        /** @var ProductRepository $productRepo */
        $productRepo = $entityManager->getRepository(Product::class);
        $products = $productRepo->getTopProducts();

        return $this->render('web/products/index.html.twig', [
            'products' => $products,
        ]);
    }

    #[Route('/products/{id}', name: 'app_web_products_show')]
    public function show(
        EntityManagerInterface $entityManager,
        int $id
    ): Response {
        /** @var ProductRepository $productRepo */
        $productRepo = $entityManager->getRepository(Product::class);
        $product = $productRepo->find($id);

        if (empty($product)) {
            $this->addFlash('error', 'Produkt nicht gefunden.');

            return $this->redirect('/products');
        }

        return $this->render('web/products/show.html.twig', [
            'product' => $product,
        ]);
    }
}
