<?php

declare(strict_types=1);

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\CartRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Uid\Uuid;

#[ORM\Entity(repositoryClass: CartRepository::class)]
#[ApiResource]
class Cart
{
    #[ORM\Id]
    #[ORM\Column(type: UuidType::NAME, unique: true)]
    #[ORM\GeneratedValue(strategy: 'CUSTOM')]
    #[ORM\CustomIdGenerator(class: 'doctrine.uuid_generator')]
    private ?Uuid $id = null;

    #[ORM\Column]
    private ?Uuid $customerId = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    public function __construct(Session $session) {
        $this->createdAt = new \DateTimeImmutable('now');

        if ($session->has('customerId')) {
            $this->customerId = $session->get('customerId');
        } else {
            $this->customerId = Uuid::v1();
            $session->set('customerId', $this->customerId->toRfc4122());
        }
    }

    public function getId(): ?Uuid
    {
        return $this->id;
    }

    public function getCustomerId(): ?Uuid
    {
        return $this->customerId;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }
}
