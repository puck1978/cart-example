<?php

declare(strict_types=1);

namespace App\Controller\Api2;

use App\Entity\Cart;
use App\Repository\CartRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class CartApiController extends AbstractController
{
    #[Route('/api/carts', name: 'app_api_carts')]
    public function index(): JsonResponse
    {
        return $this->json([]);
    }

    #[Route('/api/carts', name: 'app_api_carts')]
    public function post(
        EntityManagerInterface $entityManager,
        Request $request
    ): JsonResponse {

        dd($request);

        /** @var CartRepository $productRepo */
        $cartRepo = $entityManager->getRepository(Cart::class);

        // $cartRepo->


        return $this->json([]);
    }
}
