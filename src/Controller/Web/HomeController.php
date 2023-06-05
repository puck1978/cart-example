<?php

declare(strict_types=1);

namespace App\Controller\Web;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_web_home')]
    public function index(
        EntityManagerInterface $entityManager
    ): Response {
        /** @var ProductRepository $productRepo */
        $productRepo = $entityManager->getRepository(Product::class);
        $products = $productRepo->getTopProducts();

        return $this->render('web/home/index.html.twig', [
            'products' => $products,
        ]);
    }
}
