import { FC } from "react";
import { Link } from "react-router-dom";
import { URLS } from "@/constants/urls";
import { SearchGameInstance } from "@/types/GameInstance";
import { TimeBadge, PlayersBadge, AgeBadge, PriceBadge } from "@/components/Badge";

interface GameInstanceSearchCardProps {
  gameInstance: SearchGameInstance;
  setActive: (uuid: string) => void;
}

const GameInstanceSearchCard: FC<GameInstanceSearchCardProps> = ({
  gameInstance: {
    uuid,
    pricePerDay,
    description,
    game: { name, image, minPlayers, maxPlayers, age, playingTime },
    owner: { uuid: ownerUUID },
  },
  setActive,
}) => {

  return (
    <Link
      className="flex flex-row gap-4 rounded-lg bg-card p-3 hover:bg-accent"
      to={`${URLS.GAME_INSTANCE}/${uuid}`}
      onMouseEnter={() => setActive(ownerUUID)}
      onMouseLeave={() => setActive("")}
    >
      <div className="h-32 w-32 overflow-hidden rounded-lg">
        <img src={image} alt={name} className="h-full w-full object-cover object-top" />
      </div>
      <section className="flex w-[calc(100%-140px)] flex-col gap-2">
        <div className="flex flex-row justify-between">
          <h3 className="text-lg font-bold text-primary">{name}</h3>
        </div>
        <div className="flex w-full flex-row justify-between">
          <PriceBadge price={pricePerDay} />
          <div className="hidden flex-row flex-wrap gap-1 sm:flex">
            <TimeBadge time={playingTime} />
            <PlayersBadge minPlayers={minPlayers} maxPlayers={maxPlayers} />
            <AgeBadge age={age} />
          </div>
        </div>
        <p className="line-clamp-2 hidden break-all text-sm italic md:flex">{description}</p>
      </section>
    </Link>
  );
};

export default GameInstanceSearchCard;
